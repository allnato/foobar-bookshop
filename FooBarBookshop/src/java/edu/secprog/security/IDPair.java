/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.secprog.security;

/**
 *
 * @author CoRX
 */
public final class IDPair {
    private final int ID;
    private final String value;

    public IDPair(int ID, String value) {
        this.ID = ID;
        this.value = value;
    }

    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }
}
