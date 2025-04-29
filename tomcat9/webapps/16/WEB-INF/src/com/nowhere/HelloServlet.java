package com.nowhere;

import java.io.*;
import javax.servlet.*;             // Tomcat 10
import javax.servlet.http.*;        // Tomcat 10
import javax.servlet.annotation.*;  // Tomcat 10
 
// Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class HelloServlet extends HttpServlet {

   // The doGet() runs once per HTTP GET request to this HTTP servlet.
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
 
      // Set the response's MIME type of the response message
      response.setContentType("text/html; charset=UTF-8");
      // Allocate an output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();  // throw IOException
      
      // Write the response message, in an HTML page
      // Using triple-quoted multi-line string (Text Block) (JDK 15)
      // The beginning triple-quote must be in its own line (i.e., ends with a newline)
      out.println("""
            <!DOCTYPE html>
            <html>
            <head><title>Hello, World</title></head>
            <body>
              <h1>Hello, world!</h1>
              <p>Request URI: %s</p>
              <p>Protocol: %s</p>
              <p>PathInfo: %s</p>
              <p>Remote Address: %s</p>
              <p>A Random Number: <strong>%f</strong></p>
            </body>
            </html>
            """.formatted(request.getRequestURI(), request.getProtocol(),
                          request.getPathInfo(), request.getRemoteAddr(),
                          Math.random()));   // Multi-line text block (JDK 15) 
      out.close();  // Always close the output writer
      
      // For testing and debugging - Print a message to Tomcat's console
      System.out.println("hello world, to Tomcat!");   // Check Tomcat's console for this message
   }
}