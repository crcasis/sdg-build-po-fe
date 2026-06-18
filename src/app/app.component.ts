import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: true,
  template: `
    <div class="container">
      <h1>Technical Assessment</h1>

      <p>
        This technical assessment was designed and implemented by
        <strong>Cristian Casis</strong>.
      </p>

      <p>
        The solution showcases an enterprise-grade Google Cloud Platform architecture
        featuring Hub-and-Spoke networking, secure hybrid connectivity, Cloud Run,
        Vertex AI integration, centralized observability, disaster recovery
        capabilities, Infrastructure as Code with Terraform, and CI/CD automation.
      </p>

      <p>
        Thank you for reviewing this technical assessment.
      </p>
    </div>
  `,
  styles: [`
    .container {
      max-width: 900px;
      margin: 50px auto;
      font-family: Arial, sans-serif;
      line-height: 1.6;
    }
  `]
})
export class AppComponent {}