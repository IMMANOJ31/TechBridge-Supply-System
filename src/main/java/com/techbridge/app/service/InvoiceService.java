package com.techbridge.app.service;

import com.techbridge.app.dto.SalesDto;
import com.techbridge.app.entity.PurchaseEntity;

import java.io.File;

public interface InvoiceService {
    byte[] generateInvoiceForPurchase(PurchaseEntity purchaseEntity);

    File generateInvoicePdfForSales(SalesDto salesDto);
}
