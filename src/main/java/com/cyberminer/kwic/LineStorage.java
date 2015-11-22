package com.cyberminer.kwic;

import java.util.ArrayList;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class LineStorage {

    private ArrayList<String> lines = new ArrayList<String>();

    public ArrayList<String> getLines() {
        return lines;
    }

    public void setLines(String line) {
        this.lines.add(line);
    }

}
