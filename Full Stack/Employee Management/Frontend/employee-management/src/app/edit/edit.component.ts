// src/app/edit/edit.component.ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EmployeeService } from '../employee.service';
import { Employee } from '../employee';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {
  employee: Employee = { empId: 0, fName: '', lName: '', email: '', department: '', salary: 0 };

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private employeeService: EmployeeService
  ) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.employeeService.getEmployee(+id).subscribe(data => {
        this.employee = data;
      });
    }
  }

  updateEmployee(): void {
    if (this.employee.empId) {
      this.employeeService.updateEmployee(this.employee.empId, this.employee).subscribe(() => {
        this.router.navigate(['/']);
      });
    }
  }
}
