package com.cyberminer.kwic;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class Alphabetizer {

    private ArrayList<String> alphabetizedOutput;

    /**
     * API to perform the Alphabetizer sorting
     *
     * @param NoiseEliminatedlines
     */
    public void doAlphabetize(ArrayList<String> NoiseEliminatedlines) {
        alphabetizedOutput = new ArrayList<>(NoiseEliminatedlines);
        try {
            Collections.sort(alphabetizedOutput, String.CASE_INSENSITIVE_ORDER);
        } catch (Exception e) {

            System.err.println("Exception in doAlphabetize " + e.getMessage());
        }

    }

    /**
     * @return the alphabetizedOutput
     */
    public ArrayList<String> getAlphabetizedOutput() {
        return alphabetizedOutput;
    }

}
