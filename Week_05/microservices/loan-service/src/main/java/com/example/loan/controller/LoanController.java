
package com.example.loan.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/loan")
public class LoanController {

    @GetMapping("/{id}")
    public String getLoan(@PathVariable("id") String id) {
        return "Loan details for id: " + id;
    }
}
