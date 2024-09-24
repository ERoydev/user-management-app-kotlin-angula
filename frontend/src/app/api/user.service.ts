import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../types/user';
import { formatToDayMonthYear } from '../utils/convertStringToDate';

// https://mockapi.io/projects/668d78f1099db4c579f31309
// This service will be responsible for all REQUEST's for user data with mockAPI
// Using Observable 


@Injectable({
  providedIn: 'root'
})
export class UserService {
  private baseUrl = 'http://localhost:8080/users'

  constructor(private http: HttpClient) {}

  getAllUsers() { 
    return this.http.get<User[]>(this.baseUrl)
  }

  getUser(id: number) {
    return this.http.get<User>(`${this.baseUrl}/${id}`)
  }

  createUser(data: any) {
    const userData = this.dataPreparation(data);

    const response = this.http.post<User>(this.baseUrl, userData)
    return response;
  };

  deleteUser(userId: number) {
    const response = this.http.delete<User>(`${this.baseUrl}/${userId}`)
    return response;
  }

  editUser(userId: number, updatedUser: User) {
    const userData = this.dataPreparation(updatedUser);

    const response = this.http.put<User>(`${this.baseUrl}/${userId}`, userData)
    return response;
  }

  // Util function to prepare data for create and edit
  dataPreparation(data: any) {
    return data;
  }
}
