package com.invento.invento.utils;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import lombok.Setter;

import java.io.IOException;

public class ViewNavigator {

    @Setter
    private static Stage stage;

    public static void navigate(String pageName, boolean resizable, boolean maximize) {
        try {
            FXMLLoader loader = new FXMLLoader(ViewNavigator.class.getResource("/view/" + pageName + ".fxml"));
            Parent root = loader.load();
            Scene scene = new Scene(root);

            stage.setScene(scene);
            stage.getIcons().add(new Image(ViewNavigator.class.getResource("/assets/img/icon.png").toString()));
            stage.setTitle("Invento");
            stage.setResizable(resizable);
            stage.setMaximized(maximize);
            stage.show();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}