/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyberminer.kwic;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class NoiseEliminator {

    // This list can grow at later stage
    private ArrayList<String> noiseList = new ArrayList<>(Arrays.asList("a", "an", "is"));

    ArrayList<String> noiseFilteredlines;

    public ArrayList<String> elimateNoiseLine(ArrayList<String> lines) {
        noiseFilteredlines = new ArrayList<>(lines);

        for (String line : lines) {
            if (line.indexOf(' ') > -1) {
                if (noiseList.contains(line.substring(0, line.indexOf(' ')))) {
                    noiseFilteredlines.remove(line);
                }
            }
        }
        return noiseFilteredlines;
    }
}
