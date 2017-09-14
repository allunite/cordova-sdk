/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
        
        document.getElementById("initSdkButtonId").addEventListener("click", initDevice);
        function initDevice(){
            alert("initSdk")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.initSdk("CordovaDemo", "CA16C4FE98CF47AAB7B56137E9E3D7C1", success, failure);
        }
        
        document.getElementById("isSdkEnabledButtonId").addEventListener("click", isSdkEnabled);
        function isSdkEnabled(){
            alert("isSdkEnabled")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.isSdkEnabled(success, failure);
        }
        
        document.getElementById("setSdkEnabledButtonId").addEventListener("click", setSdkEnabled);
        function setSdkEnabled(){
            alert("setSdkEnabled")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.setSdkEnabled(true, success, failure);
        }
        
        document.getElementById("setSdkDisabledButtonId").addEventListener("click", setSdkDisabled);
        function setSdkDisabled(){
            alert("setSdkDisabled")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.setSdkEnabled(false, success, failure);
        }
        
        document.getElementById("trackWithCategotyButtonId").addEventListener("click", trackWithCategory);
        function trackWithCategory(){
            alert("setSdkEnabled")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.trackWithCategory("action category", "action id", success, failure);
        }
        
        document.getElementById("bindButtonId").addEventListener("click", bindDevice);
        function bindDevice(){
            alert("Bind")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.bindDevice(success, failure);
        }
        
        document.getElementById("startTrackingButtonId").addEventListener("click", startTracking);
        function startTracking(){
            alert("startTracking")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.startBeaconTracking(success, failure);
        }
        
        document.getElementById("stopTrackingButtonId").addEventListener("click", stopTracking);
        function stopTracking(){
            alert("stopTracking")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.stopBeaconTracking(success, failure);
        }
        
        document.getElementById("stateTrackingButtonId").addEventListener("click", stateTracking);
        function stateTracking(){
            alert("stateTracking")
            var success = function(message) {
                alert(message);
            }
            
            var failure = function() {
                alert("Error calling");
            }
            AlluniteSDK.isBeaconTrackingEnabled(success, failure);
        }
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};

app.initialize();
