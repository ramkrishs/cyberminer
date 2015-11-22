package com.cyberminer.kwic;

import java.io.IOException;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karthik Kannambadi Sridhar
 * @author Ramakrishnan Sathyavageeswaran
 * @author Vaidehi Jariwala Fall 2015 - CS 6362.001
 */
public class MasterController extends HttpServlet {

    CircularShift csObject = new CircularShift();
    Alphabetizer alphabetizerObject = new Alphabetizer();
    NoiseEliminator noiseElimatorObject = new NoiseEliminator();

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String stringName = request.getParameter("userInputString");
        if (!stringName.isEmpty()) {
            csObject.doCircularShift(stringName);

            ArrayList<String> csArrayOutput = csObject.getCsOutput();
            ArrayList<String> noiseElimatedOutput = noiseElimatorObject.elimateNoiseLine(csArrayOutput);
            alphabetizerObject.doAlphabetize(noiseElimatedOutput);

            if (!csArrayOutput.isEmpty() && alphabetizerObject != null) {

                request.setAttribute("cslist", csArrayOutput);
                request.setAttribute("alphalist", alphabetizerObject);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
                out.println(csArrayOutput);

            }
        }
    }

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }

}
