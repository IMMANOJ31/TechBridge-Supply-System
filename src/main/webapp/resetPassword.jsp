
<div class="card p-4 shadow-lg">
    <h4 class="text-center mb-3">Reset Your Password</h4>

    <form action="updatePass" method="post" id="resetPasswordForm">
        <!-- Hidden email passed from previous page -->
        <input type="hidden" name="email" value="${inputEmail}">

        <div class="mb-3">
            <label for="password" class="form-label">New Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Update Password</button>
    </form>
</div>