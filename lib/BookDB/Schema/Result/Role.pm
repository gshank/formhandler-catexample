package BookDB::Schema::Result::Role;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("roles");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "smallint",
    default_value => undef,
    is_auto_increment => 1,
    is_nullable => 0,
    size => 38,
  },
  "display_value",
  {
    data_type => "VARCHAR2",
    default_value => undef,
    is_nullable => 0,
    size => 30,
  },
  "description",
  {
    data_type => "VARCHAR2",
    default_value => undef,
    is_nullable => 1,
    size => 200,
  },
  "active",
  { data_type => "smallint", default_value => "1 ", is_nullable => 0, size => 38 },
  "modified_date",
  {
    data_type => "TIMESTAMP",
    default_value => undef,
    is_nullable => 1,
    size => 11,
  },
  "created_date",
  {
    data_type => "DATETIME",
    default_value => \"date('now')",
    is_nullable => 0,
    size => 11,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint(
  "unique_role",
  ["display_value"],
);

__PACKAGE__->has_many(
  "roles_pages",
  "BookDB::Schema::Result::RolesPage",
  { "foreign.role_fk" => "self.id" },
);
__PACKAGE__->has_many(
  "view_role_pages",
  "BookDB::Schema::Result::RolesPage",
  { "foreign.role_fk" => "self.id" },
  { where => { "edit_flag" => 0 } }
);
__PACKAGE__->has_many(
  "edit_role_pages",
  "BookDB::Schema::Result::RolesPage",
  { "foreign.role_fk" => "self.id" },
  {  where => {"edit_flag" => 1 } }
);

__PACKAGE__->many_to_many(pages => "roles_pages", 'page_fk');
__PACKAGE__->many_to_many(view_pages => 'view_role_pages', 'page_fk');
__PACKAGE__->many_to_many(edit_pages => 'edit_role_pages', 'page_fk');

1;
