package com.guduke.blog.util;

import java.util.List;

import com.guduke.blog.entity.Weather;

import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWebService;
import cn.com.webxml.WeatherWebServiceSoap;

public class WeatherUtil {
	public static Weather getWeather(String city){
		WeatherWebService factory = new WeatherWebService();
		WeatherWebServiceSoap webServiceSoap = factory.getWeatherWebServiceSoap();
		ArrayOfString arrayOfString = webServiceSoap.getWeatherbyCityName(city);
		List<String> list = arrayOfString.getString();
		String tq = list.get(6).substring(5);
		if(tq.equals("域暂时不被支持。http://www.webxml.com.cn/")){
			return null;
		}else{
			String emperature = list.get(5);
			String pic1 = list.get(8);
			String pic2 = list.get(9);
			Weather weather = new Weather(city, emperature, tq, pic1, pic2);
			return weather;
		}
	}
}
