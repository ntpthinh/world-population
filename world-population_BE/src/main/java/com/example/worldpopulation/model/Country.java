package com.example.worldpopulation.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Country implements Serializable {
    @Id
    @GeneratedValue
    private Long id;
    private String countryName;
    private Long population;
    private int ranking;
    private double worldShare;

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public Long getPopulation() {
        return population;
    }

    public void setPopulation(Long population) {
        this.population = population;
    }

    public int getRanking() {
        return ranking;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }

    public double getWorldShare() {
        return worldShare;
    }

    public void setWorldShare(double worldShare) {
        this.worldShare = worldShare;
    }

}
