# Dev-Ops

## DevOps Practice Lab

This repository is a personal DevOps practice space used to test regular workflows, improve foundational skills, and experiment with new tools, rules, and better ways of working. It is designed as a safe place to practice infrastructure automation, CI/CD, security checks, documentation habits, and operational discipline before applying them to production work.

## Purpose

The main goal of this repository is to build repeatable, practical DevOps habits through hands-on testing and small experiments. The work here focuses on using infrastructure as code, pipeline automation, version control, code review discipline, and documented learning so changes become more reliable, consistent, and easier to maintain over time.

## What this repository is used for

- Practicing Infrastructure as Code with tools such as Terraform, Bicep, or ARM where needed.
- Testing CI/CD pipeline ideas, validation stages, and deployment flow improvements.
- Trying secure DevOps and DevSecOps controls such as linting, scanning, policy checks, and review gates.
- Documenting new patterns, reusable snippets, and lessons learned from experiments.
- Improving day-to-day engineering discipline through repeatable, small, testable changes.

## Practice areas

| Area                   | Focus                                                                        |
|------------------------|------------------------------------------------------------------------------|
| Infrastructure as Code | Repeatable deployments, idempotent configuration, environment consistency    |
| CI/CD                  | Build, test, validate, and deploy using automated pipelines.                 |
| Git practices          | Small commits, branch discipline, pull requests, and review quality.         |
| Security               | Secrets handling, access control, scanning, and safer delivery workflows.    |
| Documentation          | Writing clear setup steps, usage notes, and experiment outcomes in Markdown. |
| Operations             | Learning reliable rollout, rollback, troubleshooting, and maintenance habits.|

## Working approach

This repository follows a learn-by-doing model. Each change should be small, tested where possible, and clearly documented so the result is not only a working example but also a reusable reference for future work.

Typical workflow:

1. Pick one tool, rule, pattern, or improvement idea to test.
2. Implement it in a small and isolated way.
3. Validate the result with commands, checks, or pipeline runs.
4. Record what worked, what failed, and what should be improved next.
5. Keep useful examples for reuse in real projects.

## Best practices followed here

- Prefer declarative infrastructure definitions where possible for consistency and repeatability.
- Keep environments separated and avoid mixing experimental and production-like resources.
- Make small and frequent changes instead of large risky updates.
- Use version control for everything important, including infrastructure and pipeline definitions.
- Require validation before deployment, such as format checks, linting, testing, or security scans.
- Document setup, usage, dependencies, and test steps clearly in Markdown.
- Treat automation as the default path and reduce manual configuration where possible.

## Repository structure

```text
.
├── terraform/          # IaC experiments and reusable modules
├── pipelines/          # CI/CD pipeline definitions
├── scripts/            # Helper scripts for setup, validation, and automation
├── docs/               # Notes, learning logs, and design decisions
├── tests/              # Validation checks and test files
└── README.md           # Repository overview
```

The structure can change over time as new experiments are added, but the intent is to keep code, automation, and documentation organized enough to support regular practice and easy reuse.

## Usage model

This repository can be used for:

- Daily DevOps practice
- Trying new Terraform patterns and module structures
- Testing Azure or cloud automation ideas
- Building and refining CI/CD workflows
- Exploring secure delivery and policy-based checks
- Keeping a record of learning progress and implementation patterns

## Contribution rules for personal practice

Even in a personal lab, it helps to follow a professional standard:

- Write meaningful commit messages.
- Keep changes scoped to one purpose.
- Update documentation when behavior changes.
- Avoid storing secrets in code.
- Prefer reusable patterns over one-off fixes.
- Review pipeline and infrastructure changes carefully before applying them.

## Notes

This is a working practice repository, so some folders may contain experiments, drafts, or alternative implementations. The goal is continuous improvement through structured testing, documentation, and repetition of good engineering practices rather than building a single finished product.
