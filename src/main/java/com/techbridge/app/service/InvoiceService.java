package com.techbridge.app.service;

import com.techbridge.app.entity.PurchaseEntity;

public interface InvoiceService {
    byte[] generateInvoice(PurchaseEntity purchaseEntity);
}
