## Local security checks

- Build: `docker build -f docker/Dockerfile -t ai-ecommerce-devops:latest .`
- Scan image if Trivy is installed: `trivy image --severity HIGH,CRITICAL ai-ecommerce-devops:latest`
- Scan repository for secrets/misconfigurations with your approved scanner before publishing.
- Keep base images and dependencies updated; do not put real credentials in Git.
- The image runs as a non-root user. This is a learning baseline, not a production security certification.
