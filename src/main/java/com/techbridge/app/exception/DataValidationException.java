package com.techbridge.app.exception;

public class DataValidationException extends RuntimeException{
    public DataValidationException(String msg){
        super(msg);
    }
}
