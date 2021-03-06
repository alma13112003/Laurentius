/*
 * Copyright 2015, Supreme Court Republic of Slovenia
 * 
 * Licensed under the EUPL, Version 1.1 or – as soon they will be approved by the European
 * Commission - subsequent versions of the EUPL (the "Licence"); You may not use this work except in
 * compliance with the Licence. You may obtain a copy of the Licence at:
 * 
 * https://joinup.ec.europa.eu/software/page/eupl
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under the Licence
 * is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the Licence for the specific language governing permissions and limitations under
 * the Licence.
 */
package si.laurentius.commons.enums;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joze Rihtarsic <joze.rihtarsic@sodisce.si>
 */
public enum SEDInboxMailStatus {

  /**
   *
   */
  /**
   *
   */
  //RECEIVE("RECEIVE", "Receive message in process.", "orange"),

  /**
   *
   */
  RECEIVED("RECEIVED", "Message is sucessfuly received to MSH.", "green"),
  /**
   *
   */
  PROCESS("PROCESS", "Message is locked by plugin", "darkgray"),
  /**
   *
   */
  PREADY("PREADY", "Message is locked by plugin", "darkgreen"),
  /**
   *
   */
  LOCKED("LOCKED", "Message is locked by consumer", "lightblue"),
  /**
   *
   */
  PLOCKED("PLOCKED", "Message is locked by plugin", "lightgray"),
  /**
   *
   */
  DELIVERED("DELIVERED", "Message is consumed", "darkblue"),
  /**
   *
   */
  ERROR("ERROR", "Error occured receiving, processing MSH", "red"),
  /**
   *
   */
  DELETED("DELETED", "Pošiljka je izbrisana", "black");

  private static final List<String> listOfValues;

  static {
    listOfValues = new ArrayList<>();
    for (SEDInboxMailStatus enmVal : values()) {
      listOfValues.add(enmVal.getValue());
    }
  }

  public static List<String> listOfValues() {
    return listOfValues;
  }

  String mstrVal;
  String mstrDesc;
  String mstrColor;

  private SEDInboxMailStatus(String val, String strDesc, String strColor) {
    mstrVal = val;
    mstrDesc = strDesc;
    mstrColor = strColor;
  }

  /**
   * Status code
   *
   * @return status
   */
  public String getValue() {
    return mstrVal;
  }

  /**
   ** returns status string
   *
   * @return status descr
   */
  public String getDesc() {
    return mstrDesc;
  }

  /**
   * returns status color string
   *
   * @return color string
   */
  public String getColor() {
    return mstrColor;
  }

  /**
   * Method returs color for status code
   *
   * @param strName
   * @return color string
   */
  public static String getColor(String strName) {

    if (strName != null) {
      for (SEDInboxMailStatus st : values()) {
        if (st.getValue().equals(strName)) {
          return st.getColor();
        }
      }
    }
    return strName;
  }

}
