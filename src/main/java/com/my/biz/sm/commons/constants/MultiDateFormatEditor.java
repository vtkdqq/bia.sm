package com.my.biz.sm.commons.constants;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.util.Date;

import com.google.common.base.Strings;
import com.google.common.base.Throwables;
import com.my.biz.sm.commons.util.DateUtil;

public class MultiDateFormatEditor extends PropertyEditorSupport {
	@Override
	public String getAsText() {
		Date value = (Date) getValue();
		return value == null ? "" : DateUtil.DEFAULT_DATETIME_FORMATER.get()
				.format(value);
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (Strings.isNullOrEmpty(text)) {
			setValue(null);
		}
		Date dt;
		try {
			dt = DateUtil.DEFAULT_DATETIME_FORMATER.get().parse(text);
		} catch (ParseException ex) {
			try {
				dt = DateUtil.DEFAULT_DATE_FORMATER.get().parse(text);
			} catch (Exception e) {
				throw Throwables.propagate(e);
			}
		}
		setValue(dt);
	}
}