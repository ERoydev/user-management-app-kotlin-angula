import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from 'src/app/api/user.service';
import { DialogService } from 'src/app/dialog/dialog.service';
import { User } from 'src/app/types/user';
import { formatToYearMonthDay, formatToDayMonthYear } from 'src/app/utils/convertStringToDate';
import { futureDateValidator, nameValidator } from 'src/app/utils/custom-validators';

// For the simplicity for this application i have opportunity to reuse my userForm component for edit and create.

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css']
})
export class UserFormComponent implements OnInit {
  isEditMode: boolean = false;
  private userData: User | null = null;
  userForm: FormGroup;
  isDialogOpen: boolean = false;
  errorMessage: string | null = null;


  constructor(
    private UserService: UserService,
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private fb: FormBuilder,
    private dialogService: DialogService,
  ) {
    this.userForm = this.fb.group({
      // i initialize my Form here with its validators
      firstName: ['', [Validators.required, nameValidator()]],
      lastName: ['', [Validators.required, nameValidator()]],
      dateOfBirth: ['', [Validators.required], nameValidator()],
      email: ['', [Validators.required], nameValidator()],
      phoneNumber: ['', [Validators.required], nameValidator()]
    });
  }

  ngOnInit(): void {
    // On init i get the specified user with his id
    this.activatedRoute.params.subscribe(v => {
      if (v['id']) {
        this.isEditMode = true;
        
        this.UserService.getUser(v['id']).subscribe({
          next: (response) => {
            this.userData = response;
  
            if (this.userData) {
              const birth_date = formatToYearMonthDay(this.userData.dateOfBirth)
  
              // I update my userform with the values so i can show them in input fields.
              this.userForm.patchValue({
                firstName: this.userData.firstName,
                lastName: this.userData.lastName,
                dateOfBirth: this.userData.dateOfBirth,
                phoneNumber: this.userData.phoneNumber,
                email: this.userData.email
              });
            }
          },
          error: (error) => {
            this.errorMessage = 'Failed to retrieve user by id. Please go back and try again!'
          }
        })
      } else {
        this.isEditMode = false;
      }
    })
  }

  // DIALOG
  getDialog() {
    this.isDialogOpen = this.dialogService.isDialogOpen();
  }

  openDialog(event: Event): void {
    // I open the function and the i want to get the boolen value if dialog is open or not using getDialog()
    this.dialogService.openDialog(event);
    this.getDialog();
  }

  closeDialog(): void {
    this.dialogService.closeDialog();
    this.getDialog();
  }

  submitDialog(): void {
    this.onSubmit();
    this.dialogService.submitDialog();
    this.getDialog();
  }
  // END OF DIALOG

  // This will be invoked when the dialog i submitted
  onSubmit() {
    if (this.userForm.valid) {
      const data = this.userForm.value
      
      // I check if form is in edit mode or create
      if (!this.isEditMode) {
        // CREATE
        this.UserService.createUser(data).subscribe({
          next: (response) => {
            console.log('POST Request is successful', response);
            this.errorMessage = null; // Clear error message on success
            this.router.navigate(['']);
          },
          error: (error) => {
            console.error('Error occurred during POST request', error);
            this.errorMessage = 'Failed to create user. Please try again.'; // Set error message
          }
        })
      } else {
        // EDIT
        const userId = Number(this.userData?.id);

        this.UserService.editUser(userId, data).subscribe({
          next: (response) => {
            console.log('PUT Request is successful', response);
            this.errorMessage = null; // Clear error message on success
            this.router.navigate(['']);
          },
          error: (error) => {
            console.error('Error occurred during PUT request', error);
            this.errorMessage = 'Failed to update user. Please try again.'; // Set error message
          }
        })
      
      }

    } else {
      console.log('Form is invalid');
      this.userForm.markAllAsTouched(); // This will trigger validation messages
    }
  }

  closeErrorBanner() {
    this.errorMessage = '';
  }
}
