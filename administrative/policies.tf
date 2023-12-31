resource "spacelift_policy" "default-login-policy" {
  name     = "default login"
  body     = file("../policies/login/default-login.rego")
  type     = "LOGIN"
  space_id = "root"
}

resource "spacelift_policy" "check-instance-type" {
  name     = "check-instance-type"
  body     = file("../policies/plan/check-instance-type.rego")
  type     = "PLAN"
  space_id = spacelift_space.demo-resources.id
  depends_on = [
    spacelift_stack.EC2-deployment
  ]
}

resource "spacelift_policy_attachment" "check-instance-type-attachment" {
  policy_id = spacelift_policy.check-instance-type.id
  stack_id  = spacelift_stack.EC2-deployment.id
}

resource "spacelift_policy" "require-two-approvals" {
  name     = "require-two-approvals"
  body     = file("../policies/approval/require-two-approvals.rego")
  type     = "APPROVAL"
  space_id = spacelift_space.demo-resources.id
  depends_on = [
    spacelift_stack.EC2-deployment
  ]
}

resource "spacelift_policy_attachment" "require-two-approvals-attachment" {
  policy_id = spacelift_policy.require-two-approvals.id
  stack_id  = spacelift_stack.EC2-deployment.id
}