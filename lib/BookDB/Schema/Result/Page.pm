package BookDB::Schema::Result::Page;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("pages");

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
# "active_flag",
# { data_type => "NUMBER", default_value => "1 ", is_nullable => 0, size => 38 },
  "modified_date",
  {
    data_type => "TIMESTAMP",
    default_value => undef,
    is_nullable => 1,
    size => 11,
  },
  "created_date",
  {
    data_type => "TIMESTAMP",
    default_value => "systimestamp",
    is_nullable => 0,
    size => 11,
  },
);
__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "roles_pages",
  "BookDB::Schema::Result::RolesPage",
  { "foreign.page_fk" => "self.id" },
);

1;
