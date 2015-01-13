/*
Copyright 2009-2010 Igor Polevoy 

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at 

http://www.apache.org/licenses/LICENSE-2.0 

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License. 
*/

/**
 * @author Igor Polevoy: 12/18/13 3:51 PM
 */

package app.controllers;

import org.javalite.activeweb.AppController;

import java.io.IOException;
import java.util.Date;

public class JsonController extends AppController {
    public void index() throws IOException {
        view("message", new Message("Hello, World!"));
        header("Date", new Date().toString());
        render().noLayout().contentType("application/json");
    }

    public static final class Message {
        private final String message;

        private Message(String message) {
            this.message = message;
        }

        public String getMessage() {
            return message;
        }
    }
}
