package BookDB::Schema::Result::RolesPage;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("roles_pages");

__PACKAGE__->add_columns(
  "role_fk",
  {
    data_type => "NUMBER",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 38,
  },
  "page_fk",
  {
    data_type => "NUMBER",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 38,
  },
  "edit_flag",
  { data_type => "NUMBER", default_value => "0 ", is_nullable => 0, size => 38 },
  "created_date",
  {
    data_type => "TIMESTAMP(6)",
    default_value => "systimestamp",
    is_nullable => 0,
    size => 11,
  },
);
__PACKAGE__->set_primary_key("role_fk", "page_fk");

__PACKAGE__->belongs_to("page_fk", "BookDB::Schema::Result::Page",
   { 'foreign.id' => "self.page_fk" }, {}
);

__PACKAGE__->belongs_to("role_fk", "BookDB::Schema::Result::Role",
   { 'foreign.id' => "self.role_fk" }, {}
);

1;
