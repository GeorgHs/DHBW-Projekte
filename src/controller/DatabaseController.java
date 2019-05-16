package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DatabaseController implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        // This function runs on server startup. Connect to database here

    }

    /**
     * Execute SQL Command
     * @param sql command to run
     */
    public static void executeSQL(String sql) {

    }
}
