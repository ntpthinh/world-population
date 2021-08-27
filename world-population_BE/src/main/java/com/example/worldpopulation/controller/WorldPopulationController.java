package com.example.worldpopulation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.worldpopulation.model.WorldPopulation;
import com.example.worldpopulation.service.WorldPopulationService;

@RestController
public class WorldPopulationController {
    @Autowired
    WorldPopulationService worldPopulationService;
    @GetMapping("/world-population")
    public ResponseEntity<WorldPopulation> getWorldPopulation(){
        WorldPopulation worldPopulation = worldPopulationService.getWorldPopulation();
        return ResponseEntity.ok(worldPopulation);
    }
}
