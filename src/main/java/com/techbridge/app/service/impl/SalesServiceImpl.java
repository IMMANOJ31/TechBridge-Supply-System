package com.techbridge.app.service.impl;

import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.SalesEntity;
import com.techbridge.app.repository.SalesRepo;
import com.techbridge.app.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SalesServiceImpl implements SalesService {
    private SalesRepo salesRepo;

    public SalesServiceImpl(SalesRepo salesRepo){
        this.salesRepo = salesRepo;
    }
    @Override
    public boolean save(SalesDto salesDto) {
        if (salesDto == null){
            return false;
        }
        SalesEntity salesEntity = new SalesEntity();
        BeanUtils.copyProperties(salesDto,salesEntity);
        return salesRepo.dataSaved(salesEntity);
    }
}
