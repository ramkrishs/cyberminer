package com.cyberminer.kwic;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringJoiner;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class CircularShift {

    LineStorage newObj = new LineStorage();
    private ArrayList<String> csOutput = new ArrayList<>();

    public void doCircularShift(String lines) {
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

    }

    /**
     * @return the csOutput
     */
    public ArrayList<String> getCsOutput() {
        return newObj.getLines();
    }

}
