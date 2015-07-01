package com.swcguild.blogcapstoneproject.dto;

import java.util.Objects;

/**
 *
 * @author terry
 */
public class Option {

    private int optionId;
    private String optionName;
    private String optionValue;

    public int getOptionId() {
        return optionId;
    }

    public void setOptionId(int optionId) {
        this.optionId = optionId;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public String getOptionValue() {
        return optionValue;
    }

    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 29 * hash + this.optionId;
        hash = 29 * hash + Objects.hashCode(this.optionName);
        hash = 29 * hash + Objects.hashCode(this.optionValue);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Option other = (Option) obj;
        if (this.optionId != other.optionId) {
            return false;
        }
        if (!Objects.equals(this.optionName, other.optionName)) {
            return false;
        }
        if (!Objects.equals(this.optionValue, other.optionValue)) {
            return false;
        }
        return true;
    }

}
