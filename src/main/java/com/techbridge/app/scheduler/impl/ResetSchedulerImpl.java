package com.techbridge.app.scheduler.impl;

import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.scheduler.ResetScheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ResetSchedulerImpl implements ResetScheduler {

    @Autowired
    TechBRepo repo;

    @Override @Scheduled(fixedRate = 5000)
    public void otpReset() {
        repo.clearOtp();
        System.out.println("Otp reset!!!");
    }
}
