package com.techbridge.app.repository;


import com.techbridge.app.entity.SalesEntity;

public interface SalesRepo {
    boolean dataSaved(SalesEntity salesEntity);
}
