/*
 * Copyright 2016, Supreme Court Republic of Slovenia
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
package si.laurentius.msh.web.admin;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import org.primefaces.model.DualListModel;
import si.laurentius.ebox.SEDBox;
import si.laurentius.user.SEDUser;
import si.laurentius.commons.SEDJNDI;
import si.laurentius.commons.interfaces.SEDLookupsInterface;
import si.laurentius.commons.utils.SEDLogger;
import si.laurentius.msh.web.abst.AbstractAdminJSFView;

/**
 *
 * @author Jože Rihtaršič
 */
@SessionScoped
@ManagedBean(name = "adminSEDUserView")
public class AdminSEDUserView extends AbstractAdminJSFView<SEDUser> {

  private static final SEDLogger LOG = new SEDLogger(AdminSEDUserView.class);

  @EJB(mappedName = SEDJNDI.JNDI_SEDLOOKUPS)
  private SEDLookupsInterface mdbLookups;

  private DualListModel<SEDBox> msbCBDualList = new DualListModel<>();

  /**
   *
   * @return
   */
  public DualListModel<SEDBox> getCurrentPickupDualSEDBoxList() {

    List<String> sbIDs = new ArrayList<>();
    if (getEditable() != null) {
      getEditable().getSEDBoxes().stream().forEach((sb) -> {
        sbIDs.add(sb.getLocalBoxName());
      });
    }
    List<SEDBox> src = new ArrayList<>();
    List<SEDBox> trg = new ArrayList<>();
    mdbLookups.getSEDBoxes().stream().forEach((se) -> {
      if (sbIDs.contains(se.getLocalBoxName())) {
        trg.add(se);
      } else {
        src.add(se);
      }
    });

    return msbCBDualList = new DualListModel<>(src, trg);
  }

   @Override
  public boolean validateData() {
    
    return true;
  }
  /**
   *
   * @param dl
   */
  public void setCurrentPickupDualSEDBoxList(DualListModel<SEDBox> dl) {
    msbCBDualList = dl;
  }

  /**
   *
   * @param username
   * @return
   */
  public SEDUser getSEDUserByUsername(String username) {
    List<SEDUser> lst = mdbLookups.getSEDUsers();
    for (SEDUser sb : lst) {
      if (sb.getUserId().equalsIgnoreCase(username)) {
        return sb;
      }
    }
    return null;

  }

  /**
     *
     */
  @Override
  public void createEditable() {
    long l = LOG.logStart();

    String sbname = "user_%03d";
    int i = 1;
    while (getSEDUserByUsername(String.format(sbname, i)) != null) {
      i++;
    }

    SEDUser su = new SEDUser();
    su.setUserId(String.format(sbname, i));
    su.setActiveFromDate(Calendar.getInstance().getTime());

    setNew(su);
    LOG.logEnd(l);
  }

  /**
     *
     */
  @Override
  public void removeSelected() {
    SEDUser sb = getSelected();
    if (sb != null) {
      mdbLookups.removeSEDUser(sb);
      setSelected(null);
    }
  }

  /**
     *
     */
  @Override
  public boolean persistEditable() {
    SEDUser sb = getEditable();
    boolean bsuc = false;
    if (sb != null) {
      sb.getSEDBoxes().clear();
      if (msbCBDualList.getTarget() != null && !msbCBDualList.getTarget().isEmpty()) {
        sb.getSEDBoxes().addAll(msbCBDualList.getTarget());
      }
      mdbLookups.addSEDUser(sb);
      bsuc = true;
          
      setEditable(null);
    }
    return bsuc;
  }

  /**
     *
     */
  @Override
  public boolean updateEditable() {
    SEDUser sb = getEditable();
    boolean bsuc = false;
    if (sb != null) {
      sb.getSEDBoxes().clear();
      if (msbCBDualList.getTarget() != null && !msbCBDualList.getTarget().isEmpty()) {
        sb.getSEDBoxes().addAll(msbCBDualList.getTarget());
      }
      bsuc = true;
      mdbLookups.updateSEDUser(sb);
      setEditable(null);
    }
    return bsuc;
  }

  /**
   *
   * @return
   */
  @Override
  public List<SEDUser> getList() {
    return mdbLookups.getSEDUsers();
  }

}
