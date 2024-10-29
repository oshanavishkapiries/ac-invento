package com.invento.invento.utils;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class ViewNavigator {

    private static Stage stage;

    public static void setStage(Stage primaryStage) {
        stage = primaryStage;
    }

    public static void navigate(String pageName, boolean resizable, boolean maximize) {
        try {
            FXMLLoader loader = new FXMLLoader(ViewNavigator.class.getResource("/view/" + pageName + ".fxml"));
            Parent root = loader.load();
            Scene scene = new Scene(root);

            stage.setScene(scene);
            stage.setResizable(resizable);
            stage.setMaximized(maximize);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
