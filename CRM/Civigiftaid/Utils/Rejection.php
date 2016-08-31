<?php
/*-------------------------------------------------------+
| GiftAid Improvements                                   |
| Copyright (C) 2016 SYSTOPIA                            |
| Author: B. Endres endres@systopia.de                   |
+--------------------------------------------------------+
| This program is released as free software under the    |
| Affero GPL v3 license. You can redistribute it and/or  |
| modify it under the terms of this license which you    |
| can read by viewing the included agpl.txt or online    |
| at www.gnu.org/licenses/agpl.html. Removal of this     |
| copyright header is strictly prohibited without        |
| written permission from the original author(s).        |
+--------------------------------------------------------*/

/**
 * This class will allow you to collect rejection reasons
 */
class CRM_Civigiftaid_Utils_Rejection {

  /** static array collection reasons by contribution_id. TODO: one per session/user? */
  protected static $rejectionReasons = NULL;

  
  public static function setRejectionReason($contribution_id, $reason) {
    if (self::$rejectionReasons === NULL) {
      self::$rejectionReasons = array();
    }

    self::$rejectionReasons[$contribution_id] = $reason;
  }

  public static function getRejectionReason($contribution_id) {
    if (isset(self::$rejectionReasons[$contribution_id])) {
      return self::$rejectionReasons[$contribution_id];
    } else {
      return 'Unknown';
    }
  }

  public static function getAllRejectionReasons() {
    if (self::$rejectionReasons === NULL) {
      return array();
    } else {
      return self::$rejectionReasons;
    }
  }
}
