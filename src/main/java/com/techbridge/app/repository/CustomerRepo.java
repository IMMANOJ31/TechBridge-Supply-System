package com.techbridge.app.repository;

import com.techbridge.app.entity.CustomerEntity;

public interface CustomerRepo {
    boolean saveDetails(CustomerEntity entity);

    boolean fetchDetails(CustomerEntity entity);
}
