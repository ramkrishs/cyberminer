package com.cyberminer.kwic;

import java.util.ArrayList;

/**
 *
 * 
 * @author Ramakrishnan Sathyavageeswaran
 * 
 */
public class LineStorage {

    private ArrayList<String> lines = new ArrayList<>();

    public ArrayList<String> getLines() {
        return lines;
    }

    public void setLines(String line) {
        this.lines.add(line);
    }

}
