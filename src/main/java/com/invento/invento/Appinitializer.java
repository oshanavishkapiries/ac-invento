package com.invento.invento;

import com.invento.invento.utils.ViewNavigator;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.animation.PauseTransition;
import javafx.util.Duration;

public class Appinitializer extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        showSplash(stage);
    }

    private void showSplash(Stage stage) throws Exception {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/view/SplashView.fxml"));
        Parent splashRoot = loader.load();

        Stage splashStage = new Stage();
        splashStage.initStyle(StageStyle.UNDECORATED);
        splashStage.setScene(new Scene(splashRoot));
        splashStage.show();

        PauseTransition delay = new PauseTransition(Duration.seconds(2));
        delay.setOnFinished(event -> {
            splashStage.close();
            ViewNavigator.setStage(stage);
            ViewNavigator.navigate("LogInView", false, false);
        });
        delay.play();
    }
}
