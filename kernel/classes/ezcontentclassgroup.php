<?php
//
// Definition of eZContentClassGroup class
//
//
// Copyright (C) 1999-2003 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE.GPL included in
// the packaging of this file.
//
// Licencees holding valid "eZ publish professional licences" may use this
// file in accordance with the "eZ publish professional licence" Agreement
// provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" is available at
// http://ez.no/home/licences/professional/. For pricing of this licence
// please contact us via e-mail to licence@ez.no. Further contact
// information is available at http://ez.no/home/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

//!! eZKernel
//! The class eZContentClassGroup
/*!

*/

include_once( "lib/ezdb/classes/ezdb.php" );
include_once( "kernel/classes/ezpersistentobject.php" );

class eZContentClassGroup extends eZPersistentObject
{
    function eZContentClassGroup( $row )
    {
       $this->eZPersistentObject( $row );
    }

    function &definition()
    {
        return array( "fields" => array( "id" => "ID",
                                         "name" => "Name",
                                         "creator_id" => "CreatorID",
                                         "modifier_id" => "ModifierID",
                                         "created" => "Created",
                                         "modified" => "Modified" ),
                      "keys" => array( "id" ),
                      "increment_key" => "id",
                      "class_name" => "eZContentClassGroup",
                      "sort" => array( "id" => "asc" ),
                      "name" => "ezcontentclassgroup" );
    }

    function &create( $user_id )
    {
        include_once( "lib/ezlocale/classes/ezdatetime.php" );
        $date_time = eZDateTime::currentTimeStamp();
        $row = array(
            "id" => null,
            "name" => "",
            "creator_id" => $user_id,
            "modifier_id" => $user_id,
            "created" => $date_time,
            "modified" => $date_time );
        return new eZContentClassGroup( $row );
    }

    function hasAttribute( $attr )
    {
        return ( $attr == "modifier" or
                 $attr == 'creator' or
                 eZPersistentObject::hasAttribute( $attr ) );
    }
    function &attribute( $attr )
    {
        switch( $attr )
        {
            case "modifier":
            {
                $user_id = $this->ModifierID;
            } break;
            case "creator":
            {
                $user_id = $this->CreatorID;
            } break;
            default:
                return eZPersistentObject::attribute( $attr );
        }
        include_once( "kernel/classes/datatypes/ezuser/ezuser.php" );
        $user =& eZUser::fetch( $user_id );
        return $user;
    }

    function &removeSelected ( $id )
    {
        eZPersistentObject::removeObject( eZContentClassGroup::definition(),
                                          array( "id" => $id ) );
    }

    function &fetch( $id, $user_id = false, $asObject = true )
    {
        $conds = array( "id" => $id );
        if ( $user_id !== false and is_numeric( $user_id ) )
            $conds["creator_id"] = $user_id;
        return eZPersistentObject::fetchObject( eZContentClassGroup::definition(),
                                                null,
                                                $conds,
                                                $asObject );
    }

    function &fetchList( $user_id = false, $asObject = true )
    {
        $conds = array();
        if ( $user_id !== false and is_numeric( $user_id ) )
            $conds["creator_id"] = $user_id;
        return eZPersistentObject::fetchObjectList( eZContentClassGroup::definition(),
                                                    null, $conds, null, null,
                                                    $asObject );
    }

    var $ID;
    var $Name;
    var $CreatorID;
    var $ModifierID;
    var $Created;
    var $Modified;
}

?>
