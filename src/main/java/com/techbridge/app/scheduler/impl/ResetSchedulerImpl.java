package com.techbridge.app.scheduler.impl;

import com.techbridge.app.repository.TechBRepo;
import com.techbridge.app.scheduler.ResetScheduler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ResetSchedulerImpl implements ResetScheduler {

    private TechBRepo repo;

    public ResetSchedulerImpl(TechBRepo repo){
        this.repo = repo;
    }

    @Override @Scheduled(fixedRate = 1000000)
    public void otpReset() {
        repo.clearOtp();
        log.info("Otp reseted!!!!");
    }
}
