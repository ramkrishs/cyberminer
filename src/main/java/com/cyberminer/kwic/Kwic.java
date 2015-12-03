/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.kwic;

import java.util.ArrayList;

public class Kwic {
    private CircularShift csObject;
    private Alphabetizer alphabetizerObject;
    private  NoiseEliminator noiseElimatorObject;
    
    public Kwic(){
        csObject = new CircularShift();
        alphabetizerObject = new Alphabetizer();
        noiseElimatorObject = new NoiseEliminator();
    }
    

    public ArrayList<String> getKwicOutput(String stringName) {
        ArrayList<String> alphalist = new ArrayList<>();
        try {
            csObject.doCircularShift(stringName);
            ArrayList<String> csArrayOutput = csObject.getCsOutput();
            ArrayList<String> noiseElimatedOutput = noiseElimatorObject.elimateNoiseLine(csArrayOutput);
            alphabetizerObject.doAlphabetize(noiseElimatedOutput);
            alphalist = alphabetizerObject.getAlphabetizedOutput();
            alphalist.add(stringName);
        } catch (Exception e) {
            System.err.println("Exception in getKwicOutput " + e.getMessage());
        }

        return alphalist;
    }

}
