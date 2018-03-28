package br.senai.sp.util;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatarData {
	public static Date getData(String txtData) {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date data = new Date();
		try {
			data = df.parse(txtData);
		} catch (ParseException e) {
		}
		
		return data;
	}
	
	public static String formatar(Date data) {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		return df.format(data);
	}
	
	public static Time getHorario(String horario) {
		try {
			return Time.valueOf(horario);
		} catch (Exception e) {
			SimpleDateFormat df = new SimpleDateFormat("HH:mm");
			try {
				return new Time(df.parse(horario).getTime());
			} catch (ParseException e2) {
				return new Time(System.currentTimeMillis());
			}
		}
	}
}