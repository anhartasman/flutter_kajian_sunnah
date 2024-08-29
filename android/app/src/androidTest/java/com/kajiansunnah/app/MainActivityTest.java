package com.kajiansunnah.app;

import static androidx.test.espresso.flutter.EspressoFlutter.onFlutterWidget;
import static androidx.test.espresso.flutter.action.FlutterActions.click;
import static androidx.test.espresso.flutter.action.FlutterActions.typeText;
import static androidx.test.espresso.flutter.action.FlutterActions.scrollTo;
import static androidx.test.espresso.flutter.assertion.FlutterAssertions.matches;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.isDescendantOf;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.isExisting;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.withText;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.withTooltip;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.withType;
import static androidx.test.espresso.flutter.matcher.FlutterMatchers.withValueKey;

import androidx.test.core.app.ActivityScenario;
import androidx.test.espresso.Espresso;
import androidx.test.espresso.IdlingRegistry;
import androidx.test.espresso.IdlingResource;
import androidx.test.espresso.flutter.EspressoFlutter;
import androidx.test.espresso.flutter.assertion.FlutterAssertions;
import androidx.test.espresso.flutter.matcher.FlutterMatchers;
import androidx.test.ext.junit.runners.AndroidJUnit4;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Unit tests for {@link EspressoFlutter}. */
@RunWith(AndroidJUnit4.class)
public class MainActivityTest {

    private IdlingResource idlingResource;
    private static final long WAIT_TIME_SECONDS = 5; // Wait time in seconds


    @Before
    public void setUp() throws Exception {
        ActivityScenario.launch(MainActivity.class);
        // Initialize your IdlingResource if needed
        // idlingResource = new MyIdlingResource();
        // IdlingRegistry.getInstance().register(idlingResource);
    }

    @Test
    public void performClick() throws InterruptedException  { 
        // Instead of Thread.sleep, use the onFlutterWidget methods to wait for visibility or other conditions
       
        waitForSeconds(WAIT_TIME_SECONDS);
        onFlutterWidget(withValueKey("btnContinue")).perform(click());
        waitForSeconds(WAIT_TIME_SECONDS);
        onFlutterWidget(withValueKey("columnHome")).check(matches(isExisting()));
        waitForSeconds(WAIT_TIME_SECONDS);
        onFlutterWidget(withValueKey("homePengumuman")).perform(scrollTo());
        waitForSeconds(WAIT_TIME_SECONDS);
       
        // Optionally wait for additional conditions if needed
        // onFlutterWidget(withValueKey("someOtherElement")).check(matches(isExisting()));
    }
    private void waitForSeconds(long seconds) throws InterruptedException {
        CountDownLatch latch = new CountDownLatch(1);
        Espresso.onIdle();
        new Thread(() -> {
            try {
                Thread.sleep(TimeUnit.SECONDS.toMillis(seconds));
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                latch.countDown();
            }
        }).start();
        latch.await();
    }

    @After
    public void tearDown() {
        // Unregister your IdlingResource if it was registered
        // if (idlingResource != null) {
        //     IdlingRegistry.getInstance().unregister(idlingResource);
        // }
    }
}
