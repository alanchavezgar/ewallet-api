# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

inflections = ->(inflect) {
  # Sistema
  inflect.irregular 'usuario', 'usuarios'

  # Finanzas
  inflect.irregular 'comision', 'comisiones'
  inflect.irregular 'cuenta_general', 'cuentas_generales'
  inflect.irregular 'deposito', 'depositos'
  inflect.irregular 'retiro', 'retiros'
  inflect.irregular 'transaccion', 'transacciones'
  inflect.irregular 'transferencia', 'transferencias'
}

ActiveSupport::Inflector.inflections(:en, &inflections)

ActiveSupport::Inflector.inflections('es-MX', &inflections)

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
