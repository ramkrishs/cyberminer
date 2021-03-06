package com.cyberminer.kwic;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringJoiner;

/**
 *
 * 
 * @author Ramakrishnan Sathyavageeswaran
 * 
 */
public class CircularShift {

    LineStorage newObj = new LineStorage();
    private ArrayList<String> csOutput = new ArrayList<>();

    public void doCircularShift(String lines) {
        try {
            ArrayDeque<String> cslines = new ArrayDeque<>(Arrays.asList(lines.split(" ")));
            newObj.setLines(lines);
            for (int i = 0; i < cslines.size() - 1; i++) {

                String firstWord = cslines.pop();
                cslines.add(firstWord);
                StringJoiner joiner = new StringJoiner(" ");
                for (String line : cslines) {
                    joiner.add(line);
                }
                newObj.setLines(joiner.toString());
            }
        } catch (Exception e) {
            System.err.println("Exception in doCircularShift " + e.getMessage());
        }

    }

    /**
     * @return the csOutput
     */
    public ArrayList<String> getCsOutput() {
        return newObj.getLines();
    }

}
