# Weather App

## Table of Contents  
- [Description](#description)
- [API](#api)
- [Model](#model)
- [Service](#service)
- [View](#view)

## Description

A Flutter application that allows you to see some data about the weather, like temperature, wind velocity and so on in the most popular cities of the world.

## API

This project uses [Weatherbit.io](https://www.weatherbit.io/api) API as main datasource.

## Model

There are two main classes in the model:

### [Weather](https://github.com/marcpancorbo/Weather_Flutter/blob/master/lib/model/weather.dart)

The representation of the object we want to parse from the API data, including the method to parse JSON.

### [Icon](https://github.com/marcpancorbo/Weather_Flutter/blob/master/lib/model/Icon.dart)

A class made just to parse the image received on the JSON.

## Service

### [Weather Service](https://github.com/marcpancorbo/Weather_Flutter/blob/master/lib/service/WeatherService.dart)

The main service class, which allows you to set the lat|long of the cities you want to get data about and includes the main method to make the API request.

## View

<img src="test.gif" width="400">

### [Main List](https://github.com/marcpancorbo/Weather_Flutter/blob/master/lib/main.dart)

This is the main view of the application. It includes a stateful widget generating the list of weathers with the possibility to pull the table to refresh the information.

### [Weather Detail](https://github.com/marcpancorbo/Weather_Flutter/blob/master/lib/WeatherDetail.dart)

This is the detail page of each weather, showing more information about the item selected.
