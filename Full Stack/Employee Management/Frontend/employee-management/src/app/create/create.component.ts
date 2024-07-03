// src/app/create/create.component.ts
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { EmployeeService } from '../employee.service';
import { Employee } from '../employee';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html',
  styleUrls: ['./create.component.css']
})
export class CreateComponent {
  employee: Employee = { empId: 0, fName: '', lName: '', email: '', department: '', salary: 0 };

  constructor(
    private router: Router,
    private employeeService: EmployeeService
  ) { }

  createEmployee(): void {
    this.employeeService.createEmployee(this.employee).subscribe(() => {
      this.router.navigate(['/']);
    });
  }
}
