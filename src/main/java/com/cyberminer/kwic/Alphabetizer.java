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

        Collections.sort(alphabetizedOutput, String.CASE_INSENSITIVE_ORDER);

    }

    /**
     * @return the alphabetizedOutput
     */
    public ArrayList<String> getAlphabetizedOutput() {
        return alphabetizedOutput;
    }

}
