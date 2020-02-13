## no critic: Modules::ProhibitAutomaticExportation

package Data::xmute;

# AUTHORITY
# DATE
# DIST
# VERSION

use Data::Transmute ();

use Exporter qw(import);
our @EXPORT = qw(xmute);

sub xmute {
    my $data = shift;
    for (@_) {
        $data = Data::Transmute::transmute_data(
            data => $data, rules_module=>$_);
    }
    $data;
}

1;
# ABSTRACT: Transmute (transform) data structure using rules modules

=head1 SYNOPSIS

 use Data::xmute; # exports xmute()

 my $xmuted = xmute($data, "Rule1", "Rule2", ...);


=head1 DESCRIPTION

EXPERIMENTAL.

This is a thin wrapper for L<Data::Transmute> to offer a more concise interface.


=head1 FUNCTIONS

=head2 xmute

Usage:

 my $xmuted = xmute($data, $rule_module_name1, ...);

Transmute data using one or more rule modules (modules in the
C<Data::Transmute::Rules::*> namespace, sans prefix).


=head1 SEE ALSO

L<Data::Transmute>
