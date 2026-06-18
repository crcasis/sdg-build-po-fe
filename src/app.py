from flask import Flask, render_template_string
import os

app = Flask(__name__)

HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technical Assessment</title>
    <style>
        .container {
            max-width: 900px;
            margin: 50px auto;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            padding: 0 20px;
        }
        h1 {
            color: #333;
        }
        strong {
            color: #007bff;
        }
    </style>
</head>
<body>
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
</body>
</html>
"""

@app.route('/')
def home():
    return render_template_string(HTML_TEMPLATE)

if __name__ == '__main__':
    # Cloud Run y otros entornos pasan el puerto como variable de entorno, si no usa el 8080
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)