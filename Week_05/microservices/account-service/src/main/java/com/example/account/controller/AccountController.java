
package com.example.account.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/account")
public class AccountController {

    @GetMapping("/{id}")
    public String getAccount(@PathVariable("id") String id) {
        return "Account details for id: " + id;
    }
}
