module Nerdify
    module Templates
        module OnepetOnboardings

            # def page_json(action=nil)
            #     json = super(action)
            #     json[:options][:layout]= 'fullscreen'
            #     json
            # end
            
            # def self.fieldset_or_field(component, klass, default_options={view: :editable, layout: :outside, label: true, size: 12})
            #     if component.is_a?(Nerdify::Model::Fieldset::Field)
            #         klass.component :input, name: component.name, **default_options.merge(component.options)
            #     elsif component.is_a?(Nerdify::Component)
            #         klass.component component.type, name: component.name, **default_options.merge(component.options) do |c|
            #         component.children.each do |child|
            #             klass.page.controller.fieldset_or_field(child, self, default_options)
            #         end
            #         end
            #     elsif component.is_a?(Nerdify::Model::Fieldset::Embed)
            #         if component.options[:form_object].present?
            #         klass.component :embed, name: component.name,  **default_options.merge(component.options)
            #         else
            #         embed_components = component.embed_model.nerdify.fieldsets.map{|fieldset| fieldset.to_component(klass.page, default_options)}
            #         klass.component :embed, name: component.name, embed_components: embed_components, **default_options.merge(component.embed_options)
            #         end
            #     else
            #         klass.component :fieldset, name: component.name, static: true, resource: :"#{klass.page.resource_symbol}", **{styles: (klass.page.options[:layout]=='default' ? {background: 'white', border: {left: 1, top: 1, right: 1, bottom: 1}, padding: {left: 3, top: 3, bottom: 3, right: 3}, rounded: {top_left: 2, top_right: 2, bottom_left: 2, bottom_right: 2}} : {})}.merge(**component.options) do
            #             component.children.each do |child|
            #                 klass.page.controller.fieldset_or_field(child, self, default_options)
            #             end
            #         end
            #     end
            # end

            def self.included(subclass)
                super(subclass)
                subclass.class_eval do

                    # Página padrão index
                    # - TopBar se layout default
                    # - Menu fom Nerdify::Config::Menu
                    # - Menu fom Nerdify::Config::Menu
                    # - Actions only index e on header
                    # - Lista de dados (só tabelas por enquanto)


                    def self.controller_path
                        self.to_s.underscore
                    end

                    # Página padrão new
                    # - TopBar se layout default
                    # - Menu fom Nerdify::Config::Menu
                    # - Menu fom Nerdify::Config::Menu
                    # - Actions only index e on header
                    # - Lista de dados (só tabelas por enquanto)
                    page :new, model: model, layout: 'fullscreen', header: {class: 'bg-primary'}, controller: subclass.to_s.underscore do
                        component :image, static: true, src: "/assets/images/whatsapp.png", image_size: 1, position: :float_bottom_right
                        component :container, styles: {width: 100, height: 100,  padding: {}, orientation: {body: 'horizontal'}, vertical_align: {body: 'stretch'}} do
                            component :container, size: 7, styles: { height: 100, padding: {left: 5, right: 5, bottom: 5}, margin: {}, vertical_align: {body: 'center'}, align: {body: 'center'}} do
                                component :container, size: 10 do
                                    component :image, name: :logo,  src: "assets/images/logo-color.png", static: true, styles: {width: 25, margin: {bottom: 1, top: 3}} do
                                        component :image, src: "/assets/images/flags/br.png", class: "menu-popover", click: {popover: true}, styles: {margin: {top: 2}}, circle: true, static: true, image_size: 0, position: :right do
                                            component :container , position: :popover do
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}},  i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/br.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Português", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}},  i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/en.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Inglês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/fr.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Francês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/it.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Italiano", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ge.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Alemão", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ch.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Chinês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ja.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Japonês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ru.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Russo", static: true, i18n_layout: true
                                                end
                                            end
                                        end
        
                                    end
        
        
                                    component :container,name: :steps, size: 12, styles: {margin: {top: 0, bottom: 2}} do
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i == 0 && !params[:controller].include?('accounts')"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i > 0 || params[:controller].include?('accounts')"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 1"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 1"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 2"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 2"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 3"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 3"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 4"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 4"
                                        
                                    end
        
                                    if resource_symbol == :user
                                        component :container, size: 12, styles: {margin: {top: 3}, padding: {left: 2}} do
                                            component :text, name: :"#{resource_symbol}_#{page.name}", type: :h4, size: 12, static: true, styles: {color: :primary, font_weight: 600}
                                            component :text, name: :"#{resource_symbol}_#{page.name}_help", type: :p, size: 12, static: true
                                        end
                                    end
            
                                    if resource_symbol == :account
                                        component :container, size: 12, styles: {margin: {top: 3}, padding: {left: 2}, vertical_align: {default: 'center', body: 'center', right: 'center', left: 'center'}} do
                                            component :image, position: :left, name: :cs_avatar_url, image_size: 2, resource: :"#{resource_symbol}", styles: {position: :relative, margin: {right: 2}, rounded: {top_left: 5, top_right: 5, bottom_left: 5, bottom_right: 5}} do
                                                component :image, position: :float_bottom_right, static: true, src: "/assets/images/whatsapp.png", image_size: 0
                                            end
                                            
                                            component :text, name: :wizard_title, type: :h5, styles: {font_weight: 5, color: :primary}, size: 12, resource: :"#{resource_symbol}"
                                            component :text, name: :wizard_description, type: :h6, size: 12, resource: :"#{resource_symbol}"
                                        end
                                    end
        
                                    model.nerdify.actions.select{|action| action.name.to_sym == :new   }.each do |action|
                                        component :form, size: 12, id: "new_#{resource_symbol}", resource: :"#{resource_symbol}", submit: ((action || OpenStruct.new({options: {}})).options[:submit] || { post: '..', data: {"#{resource_symbol}": ":resource"}, success: {redirect_to: "..", toast: :success}, error: {toast: :error, update: 'components'}}), backend_if: action.options[:backend_if] do     
                                            model.nerdify.fieldsets.select{|ig| (!ig.options[:only] || ig.options[:only].include?(page.name.to_s))}.each do |child|
                                                self.page.controller.fieldset_or_field(child, self)
                                            end
                                        end
                                    end
        
                                    component :container, size: 12 do
                                        model.nerdify.actions.select{|action| action.name.to_sym != :tutorial && action.options[:only].include?('new')  }.each do |action|
                                            component :button, name: :"#{action.name}_#{resource_symbol}",**action.options.merge(**{styles: (action.options[:styles] || {background: :primary}), click: action.options[:click], backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))")})
                                        end
                                    end
                                end
                            end

                            component :container, size: 5, styles: {height: 100, align: {body: 'center'}, margin: {}, padding: {}, position: :fixed, background: 'primary', display: "d-none d-md-block"} do
                                component :container, size: 12, styles: {padding: {left: 3}, margin: {left: 3}} do
                                    component :image, name: :onboarding_image, resource: :"#{resource_symbol}", styles: {width: 75, margin: {bottom: 3, top: 3, left: 5}}
                                end
                            end
                        end
                    end

                    page :edit, model: model, layout: 'fullscreen', header: {class: 'bg-primary'}, controller: subclass.to_s.underscore do

                        component :container, styles: {width: 100, height: 100,  padding: {}, orientation: {body: 'horizontal'}, align: {body: 'center'}, vertical_align: {body: 'stretch'}} do
                            component :container, size: 7, styles: { height: 100, padding: {left: 5, right: 5, bottom: 5}, margin: {}, vertical_align: {body: 'center'}, align: {body: 'center'}} do
                                component :container, size: 10 do
                                    component :image, name: :logo,  src: "assets/images/logo-color.png", static: true, styles: {width: 25, margin: {bottom: 1, top: 3}} do
                                        component :image, src: "/assets/images/flags/br.png", class: "menu-popover", click: {popover: true}, styles: {margin: {top: 2}}, circle: true, static: true, image_size: 0, position: :right do
                                            component :container , position: :popover do
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}},  i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/br.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Português", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}},  i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/en.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Inglês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/fr.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Francês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/it.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Italiano", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ge.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Alemão", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ch.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Chinês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ja.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Japonês", static: true, i18n_layout: true
                                                end
                                                component :card, size: 3, styles: {padding: {bottom: 1,top: 1}, align: {body: "center"}}, i18n_layout: true do
                                                    component :image, src: "/assets/images/flags/ru.png", circle: true, static: true, image_size: 0
                                                    component :text, type: :span, name: "Russo", static: true, i18n_layout: true
                                                end
                                            end
                                        end
                                    end
        
                                    component :container,name: :steps, size: 12, styles: {margin: {top: 0, bottom: 2}} do
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i == 0 && !params[:controller].include?('accounts')"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i > 0 || params[:controller].include?('accounts')"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 1"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 1"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 2"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 2"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 3"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 3"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'light', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i < 4"
                                        component :container, styles: {margin: {right: 1},  padding: {left:1, right: 2, top: 1, bottom: 0}, background: 'primary', rounded: {top_left: 1, top_right: 1, bottom_left: 1, bottom_right: 1}}, resource: :"#{resource_symbol}", backend_if: "params[:form_wizard].to_i >= 4"
                                    end
            
                                    if resource_symbol == :user
                                        component :container, size: 12, styles: {margin: {top: 3}, padding: {left: 2}} do
                                            component :text, name: :"#{resource_symbol}_#{page.name}", type: :h4, size: 12, static: true
                                            component :text, name: :"#{resource_symbol}_#{page.name}_help", type: :p, size: 12, static: true
                                        end
                                    end
            
                                    if resource_symbol == :account
                                        component :container, size: 12, styles: {margin: {top: 3}, padding: {left: 2}} do
                                            component :image, position: :left, name: :cs_avatar_url, click: {redirect_to: ":resource.cs_whatsapp"}, image_size: 2, resource: :"#{resource_symbol}", styles: {position: :relative, margin: {right: 2}, rounded: {top_left: 5, top_right: 5, bottom_left: 5, bottom_right: 5}} do
                                                component :image, position: :float_bottom_right, static: true, src: "/assets/images/whatsapp.png", image_size: 0
                                            end
                                            
                                            component :text, name: :wizard_title, type: :h5, styles: {font_weight: 5, color: :primary}, size: 12, resource: :"#{resource_symbol}"
                                            component :text, name: :wizard_description, type: :h6, size: 12, resource: :"#{resource_symbol}"
                                        end
                                    end
        
                                    model.nerdify.actions.select{|action| action.name.to_sym == :edit   }.each do |action|
                                        component :form, id: "edit_#{resource_symbol}", size: 12, resource: :"#{resource_symbol}", submit: ((action || OpenStruct.new({options: {}})).options[:submit] || { post: '..', data: {"#{resource_symbol}": ":resource"}, success: {redirect_to: "..", toast: :success}, error: {toast: :error, update: 'components'}}), backend_if: action.options[:backend_if] do     
                                            model.nerdify.fieldsets.select{|ig| (!ig.options[:only] || ig.options[:only].include?(page.name.to_s))}.each do |child|
                                                self.page.controller.fieldset_or_field(child, self)
                                            end
                                        end
                                    end
        
                                    component :container, size: 12 do
                                        model.nerdify.actions.select{|action| action.name.to_sym != :tutorial && action.options[:only].include?('edit')  }.each do |action|
                                            component :button, name: :"#{action.name}_#{resource_symbol}",**action.options.merge(**{styles: (action.options[:styles] || {background: :primary}), click: action.options[:click], backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))")})
                                        end
                                    end
                                end
                            end
        
                            component :container, size: 5, styles: {height: 100, align: {body: 'center'}, margin: {}, padding: {}, position: :fixed, background: 'primary', display: "d-none d-md-block"} do
                                component :container, size: 12, styles: {padding: {left: 3}, margin: {left: 3}} do
                                    component :image, name: :onboarding_image, resource: :"#{resource_symbol}", styles: {width: 100, margin: {bottom: 3, top: 3}}
                                end
                            end
                        end
                    end

                end
            end
        end
    end
end